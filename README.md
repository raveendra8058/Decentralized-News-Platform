# Decentralized News Platform

This Move module implements a simple decentralized news platform on the Aptos blockchain. Users can submit news stories and vote for them to determine their popularity.

## Module Overview

**Module Name:** `DecentralizedNewsPlatform::NewsPlatform`

### Structs

- **`NewsStory`**
  - `votes: u64` - Number of votes the story has received.
  - `url: vector<u8>` - URL or reference to the news content.

### Functions

#### `submit_story`
```move
public fun submit_story(submitter: &signer, url: vector<u8>)
```
**Description:** Allows a user to submit a news story.

- **Parameters:**
  - `submitter`: The signer representing the address submitting the story.
  - `url`: A byte-vector representing the URL or content reference for the story.

- **Behavior:**
  - Creates a `NewsStory` struct with 0 votes and the given URL.
  - Moves the `NewsStory` instance to the submitter's account.

#### `vote_for_story`
```move
public fun vote_for_story(voter: &signer, story_owner: address) acquires NewsStory
```
**Description:** Allows users to vote on a submitted news story.

- **Parameters:**
  - `voter`: The signer representing the user casting the vote.
  - `story_owner`: The address of the account that submitted the story.

- **Behavior:**
  - Borrows a mutable reference to the `NewsStory` owned by `story_owner`.
  - Increments the story's `votes` count by 1.

## Usage Instructions

1. **Submit a Story**
   - Call the `submit_story` function with your signer and the URL (as a byte vector) of your news content.

2. **Vote for a Story**
   - Call the `vote_for_story` function with your signer and the address of the user who submitted the story you want to support.

## Example Transactions

### Submit a Story
```move
DecentralizedNewsPlatform::NewsPlatform::submit_story(&signer, b"https://example.com/news-story-1");
```

### Vote for a Story
```move
DecentralizedNewsPlatform::NewsPlatform::vote_for_story(&signer, @0x1);
```

## Potential Enhancements
- Add a mechanism to prevent duplicate submissions.
- Implement a reputation system for submitters.
- Include additional metadata for stories such as title, description, and timestamp.
- Enable users to revoke their votes or change their vote.

## Security Considerations
- Ensure proper access control so that only the story owner can modify the `NewsStory` content.
- Implement validation checks for the submitted URLs to prevent spam or malicious content.

## License
This module is open-source and available for community use and contributions.

Contract Adress:  0x45f6695a048e00935c88a4bbfb5d06eaa7145a254dc6d1545bc8723e5bd6b6c0

![image](https://github.com/user-attachments/assets/e5076e67-f8ca-4fab-8ca3-3cc046429d98)


