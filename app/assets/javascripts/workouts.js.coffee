# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Format date to year-month-day for proper use by fullcalendar
jQuery ->
  $('.datepicker').datepicker
  	dateFormat: 'yy-mm-dd'
  	
