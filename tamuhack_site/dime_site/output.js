const data = [
    { person: "Pranav", score: 21 },
    { person: "Joel", score: 3 },
    { person: "Ian", score: 400 },
    { person: "Pranav", score: 20 },
    { person: "Joel", score: 31 },
    { person: "Ian", score: 401 }
  ];
  
    // apiKey = ;
    // apiUrl = ;

    // fetch(apiUrl)
    //     .then(response => response.json())
    //     .then(products => {
    //         console.log(products);
    //     })
    //     .catch(error => {
    //         console.error('Error:', error);
    //     });

  function updateLeaderboard() {
    const leaderboard = document.getElementById("leaderboard");
    leaderboard.innerHTML = "";
  
    // Sort data by score descending
    data.sort((a, b) => b.score - a.score);
  
    // Populate leaderboard dynamically
    data.forEach((entry, index) => {
      const listItem = document.createElement("li");
  
      const nameSpan = document.createElement("span");
      nameSpan.textContent = `${index + 1}. ${entry.person}`;
  
      const scoreSpan = document.createElement("span");
      scoreSpan.textContent = `${entry.score} pts`;
  
      listItem.appendChild(nameSpan);
      listItem.appendChild(scoreSpan);
  
      leaderboard.appendChild(listItem);
    });
  }
  
  // Initialize leaderboard
  updateLeaderboard();
  