---
layout: default
title: Search
nav_exclude: true
---

<!-- https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/ -->

<!--
<form action="/search.html" method="get">
  <label for="search-box">Search</label>
  <input type="text" id="search-query" name="q">
  <input type="submit" value="search">
</form>
-->

# Search results
<ul id="search-results"></ul>

<script>
  window.store = {
    {% for post in site.posts %}
      "{{ post.url | slugify }}": {
        "title": "{{ post.title | xml_escape }}",
        "author": "{{ post.author | xml_escape }}",
        "category": "{{ post.category | xml_escape }}",
        "content": {{ post.content | strip_html | strip_newlines | jsonify }},
        "url": "{{ post.url | xml_escape }}"
      }
      {% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
</script>
<script src="https://unpkg.com/lunr/lunr.js"></script>
<script src="/js/search.js"></script>
