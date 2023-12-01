document.addEventListener("DOMContentLoaded", function () {
    // Get references to the Send buttons and text areas
    const sendButton1 = document.querySelector('.send1');
    const sendButton2 = document.querySelector('.send2');
    const textarea1 = document.querySelector('.textarea1');
    const textarea2 = document.querySelector('.textarea2');
    const convo1 = document.querySelector('.convo1');
    const convo2 = document.querySelector('.convo2');

    // Initialize a variable to keep track of line breaks in textarea1 and textarea2
    let lineBreakCount1 = 0;
    let lineBreakCount2 = 0;

    // Function to create a new message element with separate divs for timestamp and text
    function createMessageElement(message, isRight) {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add(isRight ? 'right' : 'left');

        // Create a div for the user id
        const userIDDiv = document.createElement('div');
        userIDDiv.classList.add('userid');

        // Create a div for the timestamp
        const timestampDiv = document.createElement('div');
        timestampDiv.classList.add('timestamp');

        // Create a div for the text
        const textDiv = document.createElement('div');
        textDiv.classList.add('text');

        // Create a timestamp element and format it
        const timestamp = document.createElement('span');
        const now = new Date();
        const options = {
            hour: '2-digit',
            minute: '2-digit'
        };
        timestamp.textContent = now.toLocaleTimeString('ko-KR', options);

        // Set the message text
        textDiv.textContent = message;

        // Append 
        messageDiv.appendChild(userIDDiv);
        messageDiv.appendChild(textDiv);
        timestampDiv.appendChild(timestamp);
        messageDiv.appendChild(timestampDiv);

        return messageDiv;
    }
    // Event listener for Send button 1
    sendButton1.addEventListener('click', () => {
        let message = textarea1.value.trim();
        if (message) {
            // Add a newline break for each counted instance of the text
            for (let i = 0; i < lineBreakCount1; i++) {
                message += '\n';
            }
            convo1.appendChild(createMessageElement(message, true));
            convo2.appendChild(createMessageElement(message, false));
        }
        scrollToBottom(convo1);
    });

    // Wait for the DOM to be fully loaded

    let user_id = ""; // Initialize user_id

    // Event listener for Send button 2
    sendButton2.addEventListener('click', () => {
        let userId = textarea2.value.trim();
        if (userId) {
            // Establish WebSocket connection
            const socket = new WebSocket(`ws://127.0.0.1:8000/ws/${userId}`);

            socket.onopen = (event) => {
                console.log("WebSocket connection opened:", event);
            };

            socket.onmessage = (event) => {
                // Handle received messages, e.g., append them to the conversation div
                convo2.appendChild(createMessageElement(event.data, true));
            };

            socket.onclose = (event) => {
                console.log("WebSocket connection closed:", event);
            };

            // Additional code for handling UI, etc.
            lineBreakCount2 = 0;
        } else {
            console.log("User ID not provided");
        }
    });
    // Event listener for Enter key press in textarea1
    textarea1.addEventListener('keydown', (event) => {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault(); // Prevent the default behavior (line break in textarea)

            // Increment the line break count for textarea1
            lineBreakCount1++;

            // Trigger the Send button click
            sendButton1.click();
            scrollToBottom(convo1);
        } else if (event.key === 'Enter' && event.shiftKey) {
            // Add a newline break to the text in convo1
            scrollToBottom(convo1);
        }

    });

    // Event listener for Enter key press in textarea2
    textarea2.addEventListener('keydown', (event) => {
        if (event.key === 'Enter') {
            event.preventDefault(); // Prevent the default behavior (line break in textarea)

            // Increment the line break count for textarea2
            lineBreakCount2++;

            // Trigger the Send button click
            sendButton2.click();
        }
    });

    function scrollToBottom(element) {
        element.scrollTop = element.scrollHeight;
    }


});