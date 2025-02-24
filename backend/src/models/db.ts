import { Pool } from 'pg';

const pool = new Pool({
    user: 'just.ngcuong',
    password: 'Nczth@0967',
    host: 'localhost',
    port: 5432,
    database: 'souldb'
}
)

export default pool;