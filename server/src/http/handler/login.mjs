import {BooleanModel} from "../../model/boolean_model.mjs";
import {WrapperModel} from "../../model/wrapper_model.mjs";
import db from "../../database/database_operation.mjs";
import {SUCCESS_CODE, SUCCESS_DESC} from "../../common/error_code.mjs";

export default async function (ctx) {
    let reg = new RegExp(/userId=(\w+)&*/);
    let match = reg.exec(ctx.request.querystring);
    let row = await db.queryUserById(match[1]);
    let wrapperModel;
    if (row) {
        wrapperModel = new WrapperModel(SUCCESS_CODE, SUCCESS_DESC, new BooleanModel(true));
    } else {
        wrapperModel = new WrapperModel(SUCCESS_CODE, SUCCESS_DESC, new BooleanModel(false));
    }
    ctx.body = wrapperModel;
}