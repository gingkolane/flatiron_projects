// Define major html elements
// List panel on the side to display all repos
// Show panel has repo-container, user-container and completion-container

const showPanelDiv = document.getElementById('show-panel');
// const repoContainerDivTag = document.getElementById('repo-container');
// const userContainerDivTag = document.getElementById('user-container');
// const completionContainerDivTag = document.getElementById('completion-container');


// Show repo titles in list-panel
const repoListUlTag = document.getElementById('list');

fetch('http://localhost:3000/repos')
.then(response => response.json())
.then(displayRepoTitles)

function displayRepoTitles(repos) {

  repos.forEach(repo => {

    const titleLiTag = document.createElement('li');

    titleLiTag.innerText = repo.name;
    titleLiTag.dataset.id = repo.id;

    repoListUlTag.append(titleLiTag);

    return repoListUlTag;
  });
};

// Display single Repo in repo-container on click
repoListUlTag.addEventListener('click', function(event) {
  
  if (event.target.tagName === "LI") {

    const id = parseInt(event.target.dataset.id);

    return fetch(`http://localhost:3000/repos/${id}`)
    .then(response => response.json())
    .then(displayOneRepo);
  };
});

function displayOneRepo(repo) {

  const repoContainerDivTag = document.getElementById('repo-container');
  repoContainerDivTag.dataset.repoId = repo.id;

  repoContainerDivTag.innerHTML = `
    <h1>Lab name: ${repo.name} </h1>
    <p>github-repo-id: ${repo.github_repo_id} </p>
    <a href=${repo.html_url}> Repository URL: ${repo.html_url}</a>
    <br>
    `
  return repoContainerDivTag;

};


// Display one user information in user container 

// fetch one user info - let's pretend that we are user_id of 1, 
fetch('http://localhost:3000/users/1')
.then(response => response.json())
.then(displayOneUser);

function displayOneUser(user) {

  const userContainerDivTag = document.getElementById('user-container');
  userContainerDivTag.dataset.userId = user.id;

  userContainerDivTag.innerHTML = `
    <h1>Student name: ${user.login} </h1>
    <img src=${user.avatar_url}/>
    <br>  
    <a href=${user.html_url}> Github page: ${user.html_url}</a>
    <br>
    <button id="karma" data-karma=${user.karma}> ${user.karma} Karma </button>
    `

  return userContainerDivTag;
};


//On click of Next Lesson button, completionContainer and survey form shows up
 
const completionContainerDivTag = document.getElementById('completion-container');

completionContainerDivTag.addEventListener('click', function(event) {

  if (event.target.id === "next-lesson") {
    //at the time of form creation, the repo_id and user_id are defined already, so pass in with the form creation

    // use event to traverse to different container for the ids
    let repo_id = parseInt(event.currentTarget.parentElement.querySelector('#repo-container').dataset.repoId);
    let user_id = parseInt(event.currentTarget.parentElement.querySelector("#user-container").dataset.userId);

    newForm = createSurveyForm(repo_id, user_id);
    // why with let wrong?
    // let newForm = createSurveyForm(repo_id, user_id);

    // create a new completion record on form information submission 
    newForm.addEventListener('submit', function (event) {
      event.preventDefault();
      
      fetch("http://localhost:3000/completions", {
        method: 'POST',
        headers: {
          'Content-Type': "application/json",
          'Accept': 'application/json'
        },
        body: JSON.stringify({
          incompleteReason: `${newForm.incompleteReason.value}`,
          issueType: `${newForm.issueType.value}`,
          problemAnalysis: `${newForm.problemAnalysis.value}`,
          suggestedFix: `${newForm.suggestedFix.value}`,
          repo_id: `${parseInt(newForm.submit.dataset.repoId)}`,
          user_id: `${parseInt(newForm.submit.dataset.userId)}`,
          status: 0
        })
      });

// ?????????????? why can't I call repo_id and user_id inside body?
// as in repo_id: `${repo_id}` - inside function has access to outside variable

      //Reward bug fixing effort with Karma
      if (`${newForm.suggestedFix.value}` !== "") {
        
        alert('Good deed! You just earned 1 karma!')

        increaseKarmaCount(user_id);

      } else {
        alert('Thank you for your input, good luck with your labs!')
      };
    
      
    });
  };
});


function createSurveyForm(repo_id, user_id) {
  
  const completionSurveyForm = document.getElementById('completion-survey-form');

  completionSurveyForm.innerHTML = `
    <h2>Why didn't you complete this lab? </h2>
    <ul>
      <li>
        <input id="incomplete-a" type="radio" name="incompleteReason" value="A" /> 
        <label for="incomplete-a"> A. Too many labs today, don't have time to complete everything, just want to browse through.</label>
      </li>

      <li>
        <input id="incomplete-b" type="radio" name="incompleteReason" value="B"> 
        <label for="incomplete-b"> B. Spent a long time on it but can't finish...</label>
        <br>
      </li>

      <li>
        <input id="incomplete-b" type="radio" name="incompleteReason" value="C"> 
        <label for="incomplete-c"> C. I can't finish it because there is a bug in this lab.</label>
      </li>

      <li>
        <input id="incomplete-b" type="radio" name="incompleteReason" value="D"> 
        <label for="incomplete-others"> D. Other.</label>
      </li>
    </ul>

    <h2>This lab has bugs, and</h2>
    <ul>
      <li>
        <input type="radio" name="issueType" value="A">
        <label for="bug-a"> A. I don't know what to do. </label>
      </li>

      <li>
        <input type="radio" name="issueType" value="B">
        <label for="bug-b"> B. I know what is going on, but don't know how to fix it.</label>
      </li>

      <li>
        <input type="radio" name="issueType" value="C">
        <label for="bug-c"> C. I think this is the problem. </label>
        <textarea name="problemAnalysis" id="bug-c" cols="30" rows="2"></textarea>
      </li>

      <li>
        <input type="radio" name="issueType" value="D"> 
        <label for="bug-d"> D. I fixed it, and this is what I did. </label>
        <textarea name="suggestedFix" id="bug-d" cols="30" rows="2"></textarea>
      </li>


    </ul>

    <input type="submit" name="submit" value="Submit" data-repo-id=${repo_id} data-user-id=${user_id} class="submit">
    `
    return completionSurveyForm;
  }


//4. increase karma count
function increaseKarmaCount(user_id) {

  userContainer = document.getElementById('user-container');

  // let user_id = parseInt(completionContainer.dataset.userId);
  const karmaBtn = document.querySelector('#karma');
  let currentKarma = parseInt(karmaBtn.dataset.karma);
  let updatedKarma = currentKarma + 1;

  //update database
  fetch(`http://localhost:3000/users/${user_id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json', 
      'Accept': 'application/json'
    },
    body: JSON.stringify({
      "karma": `${updatedKarma}`
    })
  });

  // update DOM
  karmaBtn.dataset.karma = updatedKarma
  karmaBtn.innerText = `${updatedKarma} Karma`

};



// Extra =========================
//use native nextLessonButton for a popup window

function popUpWindow() {
  // Get the modal
  // var modal = document.getElementById("myModal");
  var popUpModal = document.querySelector(".module .module--cloud");
  // Get the button that opens the modal
  var nextLessonBtn = document.querySelector('.status-alert__button--main');
  // Get the <span> element that closes the modal
  var closeX = document.querySelector('.js--close-modal');

  // When the user clicks on the button, open the modal 
  nextLessonBtn.onclick = function() {
    popUpModal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  closeX.onclick = function() {
    popUpModal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == popUpModal) {
      popUpModal.style.display = "none";
    }
  }
}


