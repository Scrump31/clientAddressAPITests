package clientAddress;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ClientAddressTest {

  @Test
  void testParallel() {
    Results results = Runner.path("classpath:clientAddress").outputCucumberJson(true).parallel(5);
    generateReport(results.getReportDir());
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
  }

  @SuppressWarnings("unchecked")
  public static void generateReport(String karateOutputPath) {
    @SuppressWarnings("rawtypes")
    Collection jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
    @SuppressWarnings("rawtypes")
    List jsonPaths = new ArrayList(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(((File) file).getAbsolutePath()));

    Configuration configuration = new Configuration(new File("target"), "Client Address App");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, configuration);
    reportBuilder.generateReports();
  }

}
