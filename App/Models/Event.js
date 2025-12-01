// app/models/Event.js
const db = require("../services/db");

class Event {
    // Get all events with organizer name and attendee count
    static async getAll() {
        const sql = `
            SELECT 
                e.event_ID,
                e.organizer_ID,
                o.organizer_name,
                e.event_name,
                e.event_type,
                e.event_description,
                e.location,
                e.start_datetime,
                e.end_datetime,
                e.estimated_budget,
                e.status,
                COUNT(a.event_ID) AS attendee_count
            FROM event_details e
            LEFT JOIN event_attendee_details a
                ON e.event_ID = a.event_ID
            LEFT JOIN event_organized_details o
                ON e.organizer_ID = o.organizer_ID
            GROUP BY e.event_ID
            ORDER BY e.event_ID;
        `;
        return db.query(sql);
    }

    // Get events by organizer
    static async getByOrganizer(organizerID) {
        const sql = `
            SELECT 
                e.event_ID,
                o.organizer_name,
                e.event_name,
                e.event_type,
                e.event_description,
                e.location,
                e.start_datetime,
                e.end_datetime,
                e.estimated_budget,
                e.status,
                COUNT(a.event_ID) AS attendee_count
            FROM event_details e
            LEFT JOIN event_attendee_details a
                ON e.event_ID = a.event_ID
            LEFT JOIN event_organized_details o
                ON e.organizer_ID = o.organizer_ID
            WHERE e.organizer_ID = ?
            GROUP BY e.event_ID
            ORDER BY e.event_ID;
        `;
        return db.query(sql, [organizerID]);
    }

    // Get single event by ID
    static async getById(eventID) {
        const sql = `
            SELECT * FROM event_details
            WHERE event_ID = ?
        `;
        const results = await db.query(sql, [eventID]);
        return results[0];
    }
}

module.exports = Event;
