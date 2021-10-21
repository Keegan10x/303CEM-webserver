import { Client, ClientConfig } from 'https://deno.land/x/mysql/mod.ts'

const conn: ClientConfig = {
	hostname: '127.0.0.1',
	username: 'root',
	password: 'p455w0rd',
	db: 'website'
}

console.log(conn)

const db: Client = await new Client().connect(conn)

export { db }