## Written Interview Questions

1. How did you come to learn Ruby and Rails?
```bash
I started learning Ruby during my college days, when it was often seen as a clean and expressive language and that really caught my interest. I began with the basics, and when we had to deliver our web development project, I chose Ruby on Rails because it allowed me to build a complete application with very little boilerplate and a lot of focus on actual functionality. At that time, I wasn’t fully aware of Ruby’s or Rails’ full potential, I just knew it helped me move quickly and get the project done. My real growth happened in my first professional role, where I worked on a Rails project that dealt with real-world requirements like background jobs, authentication, role-based access, and web scraping. That experience helped me understand Rails beyond tutorials, and over time I naturally moved into building production-grade systems with a strong focus on maintainability, scalability, and clean design.
```

2. If you could change one thing about Rails, what would it be and why?
```bash
If I could change one thing about Rails, it would be to make the separation of responsibilities in an application more obvious by default, especially as projects grow larger. Rails makes it very easy to get started and move fast, but that same flexibility can sometimes lead to business logic creeping into places like controllers or models in ways that make the code harder to reason about over time. While experienced teams usually introduce their own patterns to keep things clean, having clearer guidance or stronger defaults around structuring complex logic would make it easier to maintain large applications without sacrificing the simplicity and developer productivity that Rails is known for.
```

3. How do you stay up to date with your technical knowledge?
```bash
I stay up to date by regularly following Ruby and Rails release notes, because they clearly explain what is changing and the problems those changes are trying to solve. I also read blog posts and discussions from people in the Ruby and Rails community, which helps me understand how new features are being used in real projects. Whenever possible, I try things out myself in small experiments or gradually introduce them into existing applications, since using a feature in practice teaches much more than just reading about it. This approach helps me stay current while still being thoughtful about what is actually worth adopting.
```

4. How do you balance adhering to Rails conventions with introducing custom abstractions?
```bash
I generally start by leaning heavily on Rails conventions because they provide a shared language that makes code easier to understand for anyone familiar with the framework. As the application grows and real complexity appears, I introduce custom abstractions only when there is a clear and repeated problem that Rails’ defaults no longer handle cleanly. When I do add abstractions, I try to keep them simple, well-named, and aligned with Rails’ philosophy so they feel like a natural extension rather than a separate layer. This balance helps the codebase stay approachable while still being flexible enough to handle more complex business logic over time.
```

5. There are multiple ways to structure a modern Rails application. One approach is to render HTML views directly from the server (potentially using tools like Hotwire or Stimulus). Another is to use Rails primarily as an API and build the front end with a JavaScript framework such as React or Vue.  What are you thoughts on the trade-offs between these two approaches?  Can you describe your comfort level with each one?
```bash
One practical way to structure a modern Rails application is to render HTML on the server and let Rails handle most of the interaction flow. With tools like Turbo and Stimulus, Rails allows pages to feel fast and interactive without pushing a large amount of logic to the browser. This keeps the application simpler, easier to maintain, and closer to how the web naturally works. I like this approach because it reduces unnecessary complexity, makes debugging more straightforward, and allows teams to focus more on business logic rather than managing a heavy frontend stack, which aligns well with how Rails is intended to be used today.
```