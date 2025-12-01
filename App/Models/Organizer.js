// app/models/Organizer.js
const db = require("../services/db");
const Event = require("./Event"); // we will use Event model

class Organizer {
    // Get all organizers
    static async getAll() {
        const sql = `
            SELECT * FROM event_organized_details
            ORDER BY organizer_ID;
        `;
        return db.query(sql);
    }

    // Get single organizer by ID
    static async getById(organizerID) {
        const sql = `
            SELECT * FROM event_organized_details
            WHERE organizer_ID = ?
        `;
        const results = await db.query(sql, [organizerID]);
        return results[0];
    }

    // Get organizer info + their events
    static async getEvents(organizerID) {
        // Get organizer info
        const organizer = await this.getById(organizerID);

        if (!organizer) {
            return { organizer_name: null, events: [] };
        }

        // Get their events
        const events = await Event.getByOrganizer(organizerID);

        return { organizer_name: organizer.organizer_name, events };
    }
}

module.exports = Organizer;
