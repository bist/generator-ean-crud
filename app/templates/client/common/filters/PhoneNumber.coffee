class PhoneNumber
   returnPhoneNumber: ->
      (phoneNumber) ->
         return ""  unless phoneNumber
         strArray = phoneNumber.split("")
         strArray.splice 3, 0, " "
         strArray.splice 7, 0, " "
         strArray.splice 10, 0, " "
         strArray.join ""
   
angular.module("<%= _.slugify(appName) %>.filters").filter "phoneNumber", new PhoneNumber().returnPhoneNumber