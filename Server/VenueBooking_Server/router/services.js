const express = require("express")
const db = require("../db")
const router = express.Router()
const utils = require("../utils")

router.get("/", (request, response) => {
  const statement = `SELECT * FROM Services `
  db.query(statement, (error, result) => {
    response.send(utils.createResult(error, result))
  })
})


// router.get("/:id", (request, response) => {
//   const id = request.params.id
//   const statement = `SELECT * FROM Services  WHERE Service_id  =?`
//   db.query(statement, [id], (error, result) => {
//     response.send(utils.createResult(error, result))
//   })
// })


router.post("/addService", (request, response) => {
  const {services_id  , isActive ,name   } = request.body
  db.query(
    "INSERT INTO Services (Service_name) VALUES(?)",
    [Service_name],
    (error, result) => {
      response.send(utils.createResult(error, result))
    }
  )
})
// router.delete("/:id", (request, response) => {
//     const id = request.params.id
//     const statement = `DELETE  FROM Services  WHERE Service_id =?`
//     db.query(statement, [id], (error, result) => {
//       response.send(utils.createResult(error, result))
//     })
//   })
  


module.exports = router