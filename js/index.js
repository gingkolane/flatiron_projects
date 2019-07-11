// 1. show repo title in list-panel
const repoListUlTag = document.getElementById('list');

fetch('http://localhost:3000/repos')
.then(response => response.json())
.then(displayTitles)

function displayTitles(repos) {

  repos.forEach(repo => {

    const titleLiTag = document.createElement('li');

    titleLiTag.innerText = repo.name;
    titleLiTag.dataset.id = repo.id;

    repoListUlTag.append(titleLiTag);

    return repoListUlTag;
  });
};

// Show panel has repo-container, user-container and completion-container

const showPanelDiv = document.getElementById('show-panel');
// const repoContainerDivTag = document.getElementById('repo-container');
// const userContainerDivTag = document.getElementById('user-container');
// const completionContainerDivTag = document.getElementById('completion-container');

// 2. set eventListener on li in repolist, on click call displayOneRepo
repoListUlTag.addEventListener('click', function(event) {
  
  if (event.target.tagName === "LI") {

    const id = parseInt(event.target.dataset.id);

    return fetch(`http://localhost:3000/repos/${id}`)
    .then(response => response.json())
    .then(displayOneRepo);

  };
});

// 2. show single repo view in repo-container
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
// -------------------------------------------------

//=================== Display user container ===================================
// let's pretend that we are user_id of 1, 
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

//completionContainer after click, 
const completionContainerDivTag = document.getElementById('completion-container');

completionContainerDivTag.addEventListener('click', function(event) {

  if (event.target.id === "next-lesson") {
    //at the time of form creation, the repo_id and user_id are defined already, so pass in with the form creation

    // use event to traverse to different container for the ids
    let repo_id = parseInt(event.currentTarget.parentElement.querySelector('#repo-container').dataset.repoId);
    let user_id = parseInt(event.currentTarget.parentElement.querySelector("#user-container").dataset.userId);

    let newForm = createSurveyForm(repo_id, user_id);

    completionContainerDivTag.append(newForm);

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

      alert('Good deed! You just earned 1 karma!')
      
      increaseKarmaCount();
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
function increaseKarmaCount() {

  userContainer = document.getElementById('user-container');
  
  let user_id = parseInt(userContainer.dataset.userId);
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
    Body: JSON.stringify({
      karma: `${updatedKarma}`
    })

  // update DOM
  // karmaBtn.dataset.karma = updatedKarma
  // karmaBtn.innerText = `${updatedKarma} Karma`

  });
};