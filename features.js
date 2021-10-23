import { db } from './db.ts'


function makeid(length) {
    let result           = [];
    const characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const charactersLength = characters.length;
    for ( let i = 0; i < length; i++ ) {
      result.push(characters.charAt(Math.floor(Math.random() * 
charactersLength)));
   }
   return result.join('');
}

function calcDays(start, end){
	const diffInMs = new Date(end) - new Date(start)
	const diffInDays = diffInMs / (1000 * 60 * 60 * 24)
	return diffInDays
}


export async function collector(table){
	const sql = `SELECT * FROM ${table}`
	const result = await db.query(sql)
	const data = {
		items:result
	}
	//console.log(sql)
	//console.log(data)
	return data
}

async function getPrice(table, col, id){
	const sql = `SELECT ${col} FROM ${table} WHERE id=${id}`
	const result = await db.query(sql)
	return result
}


export async function saveData(data){
	let sql = `SELECT id FROM accounts WHERE user = "${data.username}"`
	const result = await db.query(sql)
	const userid = result[0].id
	const paid = "pending"
	const flightId = parseInt(data.fields.flight.charAt(0))
	const hotelId = parseInt(data.fields.hotel.charAt(0))
	const tourId = parseInt(data.fields.tour.charAt(0))
	const insuranceId = parseInt(data.fields.insurance.charAt(0))
	const invoiceNo = makeid(9)
	const start = data.fields.start
	const end = data.fields.end
	const days = calcDays(start, end)
	
	
	const fPriceResult = await getPrice('flights', 'ticketPrice', flightId)
	const flightCost = fPriceResult[0].ticketPrice
	
	const hPriceResult = await getPrice('hotels', 'roomPrice', hotelId)
	const hotelCost = hPriceResult[0].roomPrice
	
	const tPriceResult = await getPrice('tours', 'tourPrice', tourId)
	const tourCost = tPriceResult[0].tourPrice
	
	const iPriceResult = await getPrice('insurance', 'insurancePrice', insuranceId)
	const insuranceCost = iPriceResult[0].insurancePrice
	
	const totalCost = flightCost + hotelCost*days + tourCost*days + insuranceCost*days
	
	
	
	sql = `INSERT INTO holidays(usr, trs, htl, ins, flt, start, end, total, isPaid, invoiceRef)\
 VALUES(${userid}, ${tourId}, ${hotelId}, ${insuranceId}, ${flightId}, '${start}', '${end}', ${totalCost}, '${paid}', '${invoiceNo}')`
	console.log(sql)
	await db.query(sql)
}