import {Application} from "@flying-dice/tslua-http-api";
import * as base64 from "@flying-dice/tslua-base64";

export const app = new Application("127.0.0.1", 16658);

app.post("/dostring_in", (req, res) => {
    if (typeof req.body !== "string") {
        res.status(400).json({error: "invalid body, should be base64 encoded lua string"});
        return;
    }

    const str = base64.decode(req.body as string);
    let result = net.dostring_in(str);
    res.json(result);
});