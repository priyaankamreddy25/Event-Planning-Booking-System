// app/models/Attendee.js
const db = require("../services/db");

class Attendee {
    // Get all attendees for a specific event
    static async getByEvent(eventID) {
        const sql = `
            SELECT *
            FROM event_attendee_details
            WHERE event_ID = ?
        `;
        return db.query(sql, [eventID]);
    }
}

module.exports = Attendee;
