package teste;

import java.util.HashMap;
import java.util.Map;

import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinMustache;

// https://javalin.io/tutorials/javalin-hibernate

public class App {

    
    public static void main(String[] args) {

        Controller controller = new Controller();
        
        var app = Javalin.create(config -> {
            config.fileRenderer(new JavalinMustache());
        })

        .get("/", ctx -> ctx.result("Hello World"))
        .get("/ok", ctx -> ctx.result("Hello World2"))
        .get("/ok_template", ctx -> ctx.render("/templateFile.html", controller.result()))
        
        .start(7070);
    }
    
}