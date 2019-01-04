def visit_homepage_and_submit_message
  visit('/')
  fill_in :content, with: 't1 message'
  click_button 'Submit'
end

def visit_homepage_and_submit_second_message
  visit('/')
  fill_in :content, with: 't2 message'
  click_button 'Submit'
end

def visit_homepage_and_click_on_existing_message_link
  visit '/'
  click_on 'Click me'
end
