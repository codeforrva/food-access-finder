module.exports.respondWithError = respondWithError = (res, statusCode, message) ->
  res.status(statusCode).json
    error:
      message: message
