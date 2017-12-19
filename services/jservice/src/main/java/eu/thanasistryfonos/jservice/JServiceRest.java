package eu.thanasistryfonos.jservice;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class JServiceRest {

    @GetMapping(name = "service", path = "/service")
    public String jservice() throws IOException {
        String retrieval = null;
        HttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost("http://localhost:8000/goservice");

        HttpResponse response =client.execute(post);
        HttpEntity entity = response.getEntity();

        retrieval = EntityUtils.toString(entity);
        return "[GET] Hello from jService" + retrieval;

    }
}
