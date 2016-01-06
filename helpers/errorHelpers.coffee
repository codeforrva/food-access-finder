# ----------------------------------
# ErrorHelper
#
# Handles responses for errors
# ----------------------------------

# Returns json response with a error object and message
#
# @param {res} response object
# @param {int} http status code to return
# @param {string} message to return
module.exports.respondWithError = respondWithError = (res, statusCode, message) ->
  res.status(statusCode).json
    error:
      message: message
