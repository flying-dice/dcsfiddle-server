import { Application } from "@flying-dice/tslua-http-api";
import { config } from "./config";
import { version } from "../../package.json";
import { logger } from "./logger";
import { cors } from "../common/cors";
import { apiDocs } from "../common/api-docs";
import { loadstringFromPath, loadstringFromPost } from "../common/loadstring";
import { errorHandler } from "../common/error-handler";
import { health } from "../common/health";

export const app = new Application(config.bindAddress, config.port);
app.useMiddleware(cors("*"));
app.useGlobalErrorHandler(errorHandler);
app.get("/health", health({ environment: "MISSION", version }));

app.get("/v3/api-docs", apiDocs);
app.post("/loadstring", loadstringFromPost(logger));
app.useMiddleware(loadstringFromPath(logger));
