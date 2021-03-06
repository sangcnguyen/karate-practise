@full-test
Feature: Delete booking

  Background:
    * url bookingURL
    * def auth = call read('classpath:auth.feature')
    * def createBooking = call read('classpath:booking/create-booking.feature')

  @delete-booking
  Scenario:  Delete booking
    Given path 'booking' , createBooking.bookingId
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And cookie token = auth.basicToken
    When method delete
    Then status 201