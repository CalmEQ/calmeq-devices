require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  
  
  test "view device and then readings" do
    get "/pies/"
    assert_response :success
    
  end
  
  test "customer workflow - view a reading" do
    # start headless
    # headless = Headless.new()
    # headless.start()

    Capybara.current_driver = :selenium
    # welcome page
    visit '/'
    assert( has_text?("CalmEQ"), "No tagline found" )
    assert( has_link?( "All devices" ), "No link to pies" )
    
    # device page
    alldevicelink = find_link( "All devices" )
    alldevicelink.click() # move to the listing page for devices
    assert_text( "Listing recording devices" )
    
    # check the table for device id, Latitude, Longitude, Noise Level, Update Time, Show Edit Destroy, and Map
    device_table = find(:table, "devices" )
    device_table.assert_selector( 'tr th', 'Id' )
    device_table.assert_selector( 'tr th', 'Latitude' )
    device_table.assert_selector( 'tr th', 'Longitude' )
    device_table.assert_selector( 'tr th', 'Noise Level' )
    device_table.assert_selector( 'tr th', 'Update Time' )
    device_table.assert_selector( 'tr td', 'Show' )
    onedevicelink = device_table.first( :link, 'Show' )
    
    # Save info for debugging
    # File.open('debug/alldevices.html', 'w') { |file| file.write(page.html) }
    # page.save_screenshot('debug/alldevices.png')
    
    # find a google map - its working but not sure how to test. 
    #assert_selector(:src, 'google.com')
    
    # print page.html
    # page.save_screenshot('screenshot.png')
    # assert_selector(:iframe)
    # within_frame 'google map' do 
    #   assert_no_text()  
    # end

    # follow the device link to an actual page
    onedevicelink.click()
    assert_text( 'Id' )
    File.open('saved_html.html', 'w') { |file| file.write(page.html) }

    # Save sheet for debugging
    # File.open('debug/onedevice.html', 'w') { |file| file.write(page.html) }
    # page.save_screenshot('debug/onedevice.png')
    
    within_frame 'googlemap' do
      # File.open('debug/onedevice_frame.html', 'w') { |file| file.write(page.html) }
      # somthing here, if google rejects the request it looks like
      #    The Google Maps API server rejected your request. This IP, site or mobile application is not authorized to use this API key. 
      #    Request received from IP address 104.154.65.238, with referer: http://127.0.0.1:39036/
      # didn't work - assert_selector(:div, 'mapDiv')
    end
    
    read_table = find(:table, "reading table" )
    read_table.assert_selector( 'tr th', 'Latitude' )
    read_table.assert_selector( 'tr th', 'Longitude' )
    read_table.assert_selector( 'tr th', 'Noise Level' )
    read_table.assert_selector( 'tr th', 'Update Time' )
    
    # done!
  end    
  
  # test "the truth" do
  #   assert true
  # end
end
