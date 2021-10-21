import { Router } from 'https://deno.land/x/oak@v6.5.0/mod.ts';
import { Handlebars } from 'https://deno.land/x/handlebars@v0.6.0/mod.ts';
import { DEFAULT_HANDLEBARS_CONFIG } from './util.ts'

import { login, loginConfig, register, registerConfig } from './auth.ts'
import { collector } from './features.js'


const handle = new Handlebars(DEFAULT_HANDLEBARS_CONFIG);
const router:Router = new Router()


router.get('/', async context => {
	const authorised = context.cookies.get('authorised')
	const data = { authorised }
	const body = await handle.renderView('home', data)
	context.response.body = body
})

//The actual part we care about


//non auth required views
router.get('/flights', async context => {
	const authorised = context.cookies.get('authorised')
	let flightData :any = await collector('flights')
	flightData.authorised = authorised
	const body = await handle.renderView('flights', flightData)
	context.response.body = body
})

router.get('/hotels', async context => {
	const authorised = context.cookies.get('authorised')
	let hotelData :any = await collector('hotels')
	hotelData.authorised = authorised
	const body = await handle.renderView('hotels', hotelData)
	context.response.body = body
})

router.get('/insurance', async context => {
	const authorised = context.cookies.get('authorised')
	let insuranceData :any = await collector('insurance')
	insuranceData.authorised = authorised
	const body = await handle.renderView('insurance', insuranceData)
	context.response.body = body
})

router.get('/tours', async context => {
	const authorised = context.cookies.get('authorised')
	let tourData :any = await collector('tours')
	tourData.authorised = authorised
	const body = await handle.renderView('tours', tourData)
	context.response.body = body
})

router.get('/holidayDeals', async context => {
	const authorised = context.cookies.get('authorised')
	const data = { authorised }
	const body = await handle.renderView('holidayDeals', data)
	context.response.body = body
})


//Dont need to touch the code below

//LOGIN GET & POST METHODS
router.get('/login', async context => {
	const body = await handle.renderView('login')
	context.response.body = body
})

router.post('/login', async context => {
	console.log('POST /login')
	const body = context.request.body({ type: 'form' })
	const value = await body.value
	const username = String(value.get('user'))
	const password = String(value.get('pass'))
	const credentials: loginConfig = { username, password }
	console.log(credentials)
	try {
		await login(credentials)
		context.cookies.set('authorised', credentials.username)
		context.response.redirect('/')
	} catch(err) {
		console.log('ERROR CAUGHT IN ROUTE')
		context.response.redirect('/login')
	}
})

//REGISTER GET & POST METHODS
router.get('/register', async context => {
	const body = await handle.renderView('register')
	context.response.body = body
})

router.post('/register', async context => {
	console.log('POST /register')
	const body = context.request.body({ type: 'form' })
	console.log(body)
	const value = await body.value
	console.log(value)
	const username: string = String(value.get('user'))
	const password: string = String(value.get('pass'))
	const password2: string = String(value.get('pass2'))
	const credentials: registerConfig = { username, password, password2 }
	console.log(credentials)
	await register(credentials)
	context.response.redirect('/login')
})

//LOGOUT
router.get('/logout', context => {
	context.cookies.delete('authorised')
	context.response.redirect('/')
})
  

export default router