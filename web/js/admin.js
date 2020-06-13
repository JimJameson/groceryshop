$(function () {
    $('.sidebar-menu li').removeClass('active');
    $('.sidebar-menu a').each(function () {
        let location = window.location.pathname;
        let link = this.pathname;
        if (link == location) {
            $(this).parent().addClass('active');
            $(this).closest('.treeview').addClass('active');
        }
    })
});