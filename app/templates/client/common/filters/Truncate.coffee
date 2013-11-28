class Truncate
   returnTruncate: -> 
      (text, length, end)->
         length = 10  if isNaN(length)
         end = "..."  if end is `undefined`
         if !text or (text and text.length == 0)
            return ""
         if text.length <= length
            text
         else
            String(text).substring(0, length - end.length) + end
 
angular.module("<%= _.slugify(appName) %>.filters").filter "truncate", new Truncate().returnTruncate