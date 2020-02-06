package com.pearson.glp.qe.pojos;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
public class GetLearningExperience {
    @Getter
    @Setter
    public int count;
    public List<learningExperiences> learningExperiences;

    public static class learningExperiences {
        public String _status;
        public String _id;
        public int _bssVer;
        public String _ver;
        public String language;
        public String _created;
        public String label;
        public Object _links;
        public String _lastModified;

    }
}
