
function InitializeRequest(sender, args) {
    if (document.getElementById('ProgressDiv') != null)
        $get('ProgressDiv').style.display = 'block';
    else
        createContorl();
}

function EndRequest(sender, args) {
    if (document.getElementById('ProgressDiv') != null)
        $get('ProgressDiv').style.display = 'none';
    else
        createContorl();
}

function createContorl() {

    var parentDiv = document.createElement("div");
    parentDiv.setAttribute("class", "ModalProgressContainer");
    parentDiv.setAttribute("Id", "ProgressDiv");


    var innerContent = document.createElement("div");
    innerContent.setAttribute("class", "ModalProgressContent");

    var img = document.createElement("img");
    img.setAttribute("src", "Images/loading.gif");

    var textDiv = document.createElement("div");
    textDiv.innerHTML = 'Loading....';



    innerContent.appendChild(img);
    innerContent.appendChild(textDiv);

    parentDiv.appendChild(innerContent);

    

    document.body.appendChild(parentDiv);
}