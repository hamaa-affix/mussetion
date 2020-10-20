class User
  #attr(属性)に対するaccessor(アクセっさー)
  #attr_accessor = getter setter
  attr_accessor :name, :email

  #initialize初期化,newした対イミングで自動的に呼び出される
  #
  def initialize(attributes = {})
    #インスタンス変数（@）
    #インスタンス変数をコントローラーで定義するとviewで使える様になる。というか勝手に変数がviewに渡っている。
    @name = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@email} <#{@name}>"
  end
end

# class User
# {
#   private $name;
#   private $email;

#   public function __construct($name, $email)
#   {
#     this.name = $name;
#     this.email = $email;
#   }

#   public function FormattedEmail () {
#     echo "this.name.<this.email>"
#   }
# }
