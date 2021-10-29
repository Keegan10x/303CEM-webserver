import { HandlebarsConfig } from "https://deno.land/x/handlebars@v0.6.0/mod.ts";

export const DEFAULT_HANDLEBARS_CONFIG: HandlebarsConfig = {
  baseDir: "views",
  extname: ".hbs",
  layoutsDir: "layouts/",
  partialsDir: "partials/",
  defaultLayout: "",
  helpers: undefined,
  compilerOptions: undefined,
};
