<ul class="footer-nav">
    <% loop $Menu(2) %>
        <li class="$LinkingMode">
            <a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
        </li>
    <% end_loop %>
</ul>