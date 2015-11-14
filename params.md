<form action="post" url="/posts/1">
  
  <input type="hidden" name="utf8" value="√">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <input type="text" name="post[title]" value="My Super Title">
  <input type="text" name="post[body]" value="Some Body of a post">
  <input type="checkbox" name="post[tag_ids][]" value="">
  <input type="checkbox" name="post[tag_ids][]" value="2">
  <input type="checkbox" name="post[tag_ids][]" value="3">
  <input type="checkbox" name="post[tag_ids][]" value="5">
  <input type="hidden" name="commit" value="Update Post">
  <input type="hidden" name="id" value="1">

</form>