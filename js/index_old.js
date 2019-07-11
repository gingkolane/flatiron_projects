// - Get a list of books & render them
const divTagListPanel = document.getElementById('list-panel');
const divTagShowPanel = document.getElementById('show-panel');

//fetch books and display them in divTagListPanel

fetch('http://localhost:3000/books')
.then(response => response.json())
.then(books => {
  return books.forEach(book => {
    
    const liTag = document.createElement('li');
    liTag.classList.add('book-title');
    liTag.dataset.id = book.id;
    liTag.innerText = book.title;
    divTagListPanel.append(liTag);

  });
});


// show each book information in showpanel at click

// get id of book clicked, then fetch info of that id to display
divTagListPanel.addEventListener('click', function(event) {

  if (event.target.className ==='book-title') {
    let id = parseInt(event.target.dataset.id); 
    
    fetch(`http://localhost:3000/books/${id}`)
    .then(response => response.json())
    .then(displayOneBook)

    divTagShowPanel.innerHTML = '';

  };

});


//display img, description, and a list of users of one book

function displayOneBook(book) {

  const imgTag = document.createElement('img');
  imgTag.src = book.img_url;

  const pTag = document.createElement('p');
  pTag.innerText = book.description;

  const ulTag = document.createElement('ul');
  ulTag.id = "user-list";
  ulTag.dataset.userArr = JSON.stringify(book.users)
  ulTag.dataset.id = book.id;

  book.users.forEach(user => {

    const liTagUser = document.createElement('li');
    liTagUser.innerText = user.username;
    ulTag.append(liTagUser);
  })

  const likeButton = document.createElement('button');
  likeButton.innerText = "LIKE IT";

  divTagShowPanel.append(imgTag, pTag, ulTag, likeButton);
  divTagShowPanel.dataset.id = book.id

};


// like a book as a user-----------------

divTagShowPanel.addEventListener('click', likeABook)

function likeABook(event) {

  if (event.target.tagName === 'BUTTON') {

  // update the DOM
    const myLi = document.createElement('li');
    myLi.dataset.id = 1;
    myLi.innerText = "pouros";

    event.currentTarget.querySelector('#user-list').append(myLi);
  
    // update the server
    let id = parseInt(event.currentTarget.dataset.id);
    let userArr = event.target.parentElement.querySelector('#user-list').dataset.userArr;
    // let biggerArr = newUserArr.push({"id":"1", "username":"pouros"})
debugger
    fetch(`http://localhost:3000/books/${id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        users: userArr
      })
    });
  };
};