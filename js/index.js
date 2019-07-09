// 1. show repo title in list-panel

const listUlTag = document.getElementById('list');
const showPanelDiv = document.getElementById('show-panel');

fetch('http://localhost:3000/repos')
.then(response => response.json())
.then(displayTitles)

function displayTitles(repos) {

  repos.forEach(repo => {

    const titleLiTag = document.createElement('li');

    titleLiTag.innerText = repo.name;
    titleLiTag.dataset.id = repo.id;

    listUlTag.append(titleLiTag);

    return listUlTag;
  });
};

// 2. show single repo view in show-panel

listUlTag.addEventListener('click', function(event) {
  
  if (event.target.tagName === "LI") {

    const id = parseInt(event.target.dataset.id);

    return fetch(`http://localhost:3000/repos/${id}`)
    .then(response => response.json())
    .then(displayOneLab);

  };
});

function displayOneLab(repo) {

  const repoLiTag = document.createElement('Li');

  repoLiTag.innerHTML = `
  <h1>Lab name: ${repo.name} </h1>
  <p>github-repo-id: ${repo.github_repo_id} </p>
  <a href=${repo.html_url}> Repository URL: ${repo.html_url}</a>
  `

  showPanelDiv.append(repoLiTag);
  return showPanelDiv;

}


// 3. form for fill in completion status (create)

const surveyForm = document.getElementById('survey-form');

surveyForm.addEventListener('submit', function (event) {
  event.preventDefault();
  fetch("http://localhost:3000/completions", {
    method: 'POST',
    headers: {
      'Content-Type': "application/json",
      'Accept': 'application/json'},
    body: JSON.stringify({
      incompleteReason: `${surveyForm.incompleteReason.value}`,
      issueType: `${surveyForm.issueType.value}`,
      problemAnalysis: `${surveyForm.problemAnalysis.value}`,
      suggestedFix: `${surveyForm.suggestedFix.value}`
    })
  });
});