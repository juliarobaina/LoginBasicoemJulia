using Genie.Router
using Genie, Genie.Requests, Genie.Renderer.Html

#Genie.jl: Defini rotas, podendo utilizar com padrão REST
#postpalyload(chave(nomeDoCampo),"ValorPadrão") -> receber dados via POST
#serve_static_file("string") -> Lê o arquivo estático e retorna o conteúdo como um Response
#up() Ir para o servidor

route("/") do
  serve_static_file("teste.html")
end

route("/teste-submit-form", method = POST) do
  login = "$(postpayload(:login, "Anon"))"
  senha = "$(postpayload(:senha, "Anon"))"
  
  
  if login == "Joaquim" && senha == "123456"
    
    "<p>Logado com sucesso!</p>"
    string("<p>Bem-Vindo", " ", login,"</p>") #concatena strings
   
  else

    "<p>Login ou senha incorreta</p>"

  end
end

up()