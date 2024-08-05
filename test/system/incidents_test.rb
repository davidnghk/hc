require "application_system_test_case"

class IncidentsTest < ApplicationSystemTestCase
  setup do
    @incident = incidents(:one)
  end

  test "visiting the index" do
    visit incidents_url
    assert_selector "h1", text: "Incidents"
  end

  test "creating a Incident" do
    visit incidents_url
    click_on "New Incident"

    fill_in "Details", with: @incident.details
    fill_in "Heading", with: @incident.heading
    fill_in "Incident Datetime", with: @incident.incident_datetime
    fill_in "Location", with: @incident.location_id
    fill_in "Ref", with: @incident.ref
    fill_in "Request Datetime", with: @incident.request_datetime
    fill_in "Responsible User", with: @incident.responsible_user_id
    fill_in "Source", with: @incident.source
    fill_in "Status", with: @incident.status
    fill_in "Task", with: @incident.task
    fill_in "Type", with: @incident.type
    fill_in "User", with: @incident.user_id
    fill_in "Worker User", with: @incident.worker_user_id
    click_on "Create Incident"

    assert_text "Incident was successfully created"
    click_on "Back"
  end

  test "updating a Incident" do
    visit incidents_url
    click_on "Edit", match: :first

    fill_in "Details", with: @incident.details
    fill_in "Heading", with: @incident.heading
    fill_in "Incident Datetime", with: @incident.incident_datetime
    fill_in "Location", with: @incident.location_id
    fill_in "Ref", with: @incident.ref
    fill_in "Request Datetime", with: @incident.request_datetime
    fill_in "Responsible User", with: @incident.responsible_user_id
    fill_in "Source", with: @incident.source
    fill_in "Status", with: @incident.status
    fill_in "Task", with: @incident.task
    fill_in "Type", with: @incident.type
    fill_in "User", with: @incident.user_id
    fill_in "Worker User", with: @incident.worker_user_id
    click_on "Update Incident"

    assert_text "Incident was successfully updated"
    click_on "Back"
  end

  test "destroying a Incident" do
    visit incidents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incident was successfully destroyed"
  end
end
