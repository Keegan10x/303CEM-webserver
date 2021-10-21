import { Application} from 'https://deno.land/x/oak@v6.5.0/mod.ts'
import router from './routes.ts'
import { Handlebars } from 'https://deno.land/x/handlebars@v0.6.0/mod.ts';
import {DEFAULT_HANDLEBARS_CONFIG} from './util.ts'

const app = new Application();
const handle = new Handlebars(DEFAULT_HANDLEBARS_CONFIG);
const port:number = 3000;

app.use(router.routes())
app.use(router.allowedMethods())

app.listen({ port })
console.log(`Listening on port ${port}`)


//deno run --allow-all --unstable index.ts