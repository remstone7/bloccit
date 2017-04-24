class FavoriteMailer < ApplicationMailer
  default from: 'remstone7@gmail.com'

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@still-basin-77277.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@ystill-basin-77277.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@still-basin-77277.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)
     headers['Message-ID'] = "<post/#{post.id}@still-basin-77277.herokuapp.com>"
     headers['In-Reply-To'] = "<post/#{post.id}@still-basin-77277.herokuapp.com>"
     headers['References'] = "<post/#{post.id}@still-basin-77277.herokuapp.com>"
     @user = user
     @post = post
     mail(to: user.email, subject: "You created a new post: #{post.title}")
   end

end
