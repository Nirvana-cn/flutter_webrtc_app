import login from "./handler/login.mjs"

const routeMap = new Map();
routeMap.set("/v1/login", login);

export default async function (ctx) {
    if (routeMap.has(ctx.request.path)) {
        await routeMap.get(ctx.request.path)(ctx);
    }
}