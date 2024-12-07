
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            const mainContent = document.querySelector('.main-content');
            sidebar.classList.toggle('active');
            mainContent.classList.toggle('shifted');
        }

        function toggleDropdown(type) {
            const dropdownContent = document.getElementById(`${type}-dropdown`);
            const arrow = dropdownContent.previousElementSibling.querySelector('.arrow');
            dropdownContent.classList.toggle('show');

            // Rotate arrow when dropdown is toggled
            if (dropdownContent.classList.contains('show')) {
                arrow.style.transform = "rotate(180deg)";
            } else {
                arrow.style.transform = "rotate(0deg)";
            }
        }
