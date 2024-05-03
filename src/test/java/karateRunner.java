import com.intuit.karate.junit5.Karate;

public class karateRunner {
    @Karate.Test
    Karate testSample() {
       return Karate.run("classpath:apiREST/karateTest.feature").relativeTo(getClass());
        // para ejecutar solo caso segun su tag, anotacion del feature
        // return Karate.run("classpath:apiREST/karateTest.feature").tags("@casoPost");
       // return Karate.run("classpath:apiREST/csv&json.feature").tags("@csv&json");
        //return Karate.run("classpath:apiREST/csv&json.feature").relativeTo(getClass());

    }

    @Karate.Test
    Karate testSample2() {
        return Karate.run("classpath:apiSOAP/testSOAP.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSample3() {
        return Karate.run("classpath:apiGRAPHQL/graphQLTEST.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSample4() {
        return Karate.run("classpath:apiREST/tokenBearer.feature").relativeTo(getClass());
    }
}
