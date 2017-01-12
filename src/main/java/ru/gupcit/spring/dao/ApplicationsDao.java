package ru.gupcit.spring.dao;

/**
 * Created by zaur on 09.01.17.
 */
import ru.gupcit.spring.model.Applications;

import java.util.List;

public interface ApplicationsDao {
    public List getAllApplications();
    public List getApplicationsFromUser();
    public void setApplication(Applications application);
}
