module DecentralizedNewsPlatform::NewsPlatform {

    use aptos_framework::signer;

    /// Struct representing a news story.
    struct NewsStory has store, key {
        votes: u64,
        url: vector<u8>, // URL or reference to the news content
    }

    /// Function to submit a news story.
    public fun submit_story(submitter: &signer, url: vector<u8>) {
        let story = NewsStory {
            votes: 0,
            url,
        };
        move_to(submitter, story);
    }

    /// Function to vote on a submitted news story.
    public fun vote_for_story(voter: &signer, story_owner: address) acquires NewsStory {
        let story = borrow_global_mut<NewsStory>(story_owner);
        story.votes = story.votes + 1;
    }
}
