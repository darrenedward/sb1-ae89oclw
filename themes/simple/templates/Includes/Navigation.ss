<ul class="navbar-nav me-auto mb-2 mb-lg-0">
    <% loop $Menu(1) %>
        <li class="nav-item $LinkingMode">
            <a class="nav-link" href="$Link" title="$Title.XML">$MenuTitle.XML</a>
        </li>
    <% end_loop %>
    <% if $CurrentMember %>
        <li class="nav-item">
            <a class="nav-link" href="$BaseHref/account/orders">My Orders</a>
        </li>
    <% end_if %>
</ul>