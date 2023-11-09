window.addEventListener('DOMContentLoaded', function() {
  console.log("hello");
  const sortButton = document.getElementById('sort-button');
  let sortOrder = 'desc'; // Initial sort order (default to descending)

  sortButton.addEventListener('click', () => {
    if (sortOrder === 'desc') {
      sortOrder = 'asc';
      sortButton.textContent = 'Sort by Name (Ascending)';
    } else {
      sortOrder = 'desc';
      sortButton.textContent = 'Sort by Name (Descending)';
    }

    // Update the sort order using JavaScript or your preferred framework
    updateSortOrder(sortOrder);
  });

  function updateSortOrder(sortOrder) {
    // Get all table rows
    const tableRows = Array.from(document.querySelectorAll('tr'));

    // Sort the rows based on the sort order
    if (sortOrder === 'asc') {
      tableRows.sort((row1, row2) => {
        const name1 = row1.querySelector('td:first-child').textContent.toLowerCase();
        const name2 = row2.querySelector('td:first-child').textContent.toLowerCase();

        if (name1 < name2) {
          return -1;
        } else if (name1 > name2) {
          return 1;
        } else {
          return 0;
        }
      });
    } else {
      tableRows.sort((row1, row2) => {
        const name1 = row1.querySelector('td:first-child').textContent.toLowerCase();
        const name2 = row2.querySelector('td:first-child').textContent.toLowerCase();

        if (name1 > name2) {
          return -1;
        } else if (name1 < name2) {
          return 1;
        } else {
          return 0;
        }
      });
    }

    // Re-append the sorted rows to the table body
    const tableBody = document.querySelector('tbody');
    tableBody.innerHTML = '';
    tableRows.forEach(row => tableBody.appendChild(row));
  }
});