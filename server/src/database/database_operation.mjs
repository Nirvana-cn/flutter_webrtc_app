import sqlite3 from 'sqlite3';
import {TABLE_NAME} from "../common/constant.mjs";

const db = new sqlite3.Database("./src/database/database.db", function (err) {
    if (err) throw err;
});

function executeMethodAll(sql) {
    console.log("Execute SQL: " + sql);
    return new Promise((resolve, reject) => {
        db.all(sql, function (err, rows) {
            resolve(rows);
        })
    })
}

function executeMethodGet(sql) {
    console.log("Execute SQL: " + sql);
    return new Promise((resolve, reject) => {
        db.get(sql, function (err, row) {
            resolve(row);
        })
    })
}

async function queryOnline() {
    return await executeMethodAll(`select * from ${TABLE_NAME} where isOnline = 1`);
}

async function queryUserById(userId) {
    return await executeMethodGet(`select * from ${TABLE_NAME} where userId = "${userId}"`);
}

async function query(userId) {
    return new Promise((resolve, reject) => {
        db.get(`select * from ${TABLE_NAME} where userId = "${userId}"`, function (err, row) {
            console.log(row);
            if (row) {
                resolve(true);
            } else {
                resolve(false);
            }
        })
    });
}

function add(host) {
    if (host instanceof Host) {
        let sql = db.prepare(`insert into host values ("${host.mac}", "${host.name}",${host.status})`);
        sql.run();
    } else {
        throw Error("host is not instance of Host");
    }
}

async function update(host) {
    if (host instanceof Host) {
        let sql = db.prepare(`update host set status = ${host.status}, hostName = "${host.name}" where mac = "${host.mac}"`);
        sql.run();
    } else {
        throw Error("host is not instance of Host");
    }

}

export default {
    queryOnline,
    queryUserById
}
