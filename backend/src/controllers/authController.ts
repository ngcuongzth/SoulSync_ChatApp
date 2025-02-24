import { Request, Response } from "express";
import bcrypt from 'bcrypt'
import pool from "../models/db";
import jwt from "jsonwebtoken";

const SALT_ROUNDS = 10;
const JWT_SECRET = process.env.JWT_SECRET || 'soulsecretkey';



const check_exists = async (field: string, value: string): Promise<boolean> => {
    try {
        const result = await pool.query(`SELECT * FROM users WHERE ${field} = $1`, [value])
        return result.rows.length > 0;
    }
    catch (error) {
        return false;
    }
}

const get_info = async (field: string, value: string): Promise<boolean> => {
    try {
        const result = await pool.query(`SELECT * FROM users WHERE ${field} = $1`, [value])
        return result.rows.length > 0;
    }
    catch (error) {
        return false;
    }
}

export const register = async (req: Request, res: Response): Promise<any> => {
    // 1. get payload data : username, email, password
    // 2. insert those data into our db 
    // 3. return message, user,
    const { username, email, password } = req.body;
    try {
        if (await check_exists('username', username)) {
            return res.status(400).json({ error: "Username already exists" });
        }
        if (await check_exists("email", email)) {
            return res.status(400).json({ error: "Email already exists" });
        }

        const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS)

        const result = await pool.query(
            "INSERT INTO users(username, email, password) VALUES($1,$2,$3) RETURNING *",
            [username, email, hashedPassword]
        )
        const user = result.rows[0]
        return res.status(201).json({ message: 'User register successfully!', user })
    }
    catch (error) {
        return res.status(500).json({ error: 'Failed to register user' })
    }
}

export const login = async (req: Request, res: Response): Promise<any> => {
    // 1. get payload data: email, password
    // 2. verity if email exits
    // 3. compare pwd -> 'invalid credentials'
    // 4. return token

    const { email, password } = req.body;
    try {
        const reuslt = await pool.query(
            'SELECT * FROM users WHERE email =$1', [email]
        )
        const user = reuslt.rows[0];
        if (!user) {
            return res.status(404).json({ error: "User not found." });
        }
        const isMatch = await bcrypt.compare(password, user.password)
        if (!isMatch) {
            return res.status(400).json({ error: "Invalid credentials." })
        }
        const token = jwt.sign({ id: user.id }, JWT_SECRET, { expiresIn: "24h" })
        return res.status(200).json({ message: 'Logged in successfully', token })
    }
    catch (error) {
        return res.status(500).json({ error: "Failed to login" })
    }
}