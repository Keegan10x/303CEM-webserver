import { db } from './db.ts'


export async function collector(table){
	const sql = `SELECT * FROM ${table}`
	const result = await db.query(sql)
	const data = {
		items:result
	}
	console.log(sql)
	console.log(data)
	return data
}