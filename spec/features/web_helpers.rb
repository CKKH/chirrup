def visit_homepage_and_submit_message_with_tag
  visit('/')
  fill_in :content, with: 't1 message'
  fill_in :tag, with: 't1 tag'
  click_button 'Submit'
end

def visit_homepage_and_submit_second_message_with_tag
  visit('/')
  fill_in :content, with: 't2 message'
  fill_in :tag, with: 't2 tag'
  click_button 'Submit'
end

def visit_homepage_and_click_on_existing_message_link
  visit '/'
  click_on 'Click me'
end
