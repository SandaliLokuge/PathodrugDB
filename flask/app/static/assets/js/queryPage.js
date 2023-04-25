function changeplh() {
    var sel = document.getElementById("selection");
    var textbx = document.getElementById("textbox");
    var indexe = sel.selectedIndex;

    if (indexe == 1) {
        jQuery("#textbox").attr("placeholder", "Type organism name ");

    }
    if (indexe == 2) {
        jQuery("#textbox").attr("placeholder", "Type drug name");
    }
}

function setExample() {
    var sel = document.getElementById("selection");
    var textbx = document.getElementById("textbox");
    var indexe = sel.selectedIndex;

    if (indexe == 1) {
        jQuery("#textbox").attr("value", "Pseudomonas aeruginosa");

    }
    if (indexe == 2) {
        jQuery("#textbox").attr("value", "Insulin");
    }
}