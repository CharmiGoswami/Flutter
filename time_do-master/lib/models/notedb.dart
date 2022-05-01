class NoteDB {
    int? id;
    String? title;
    String? description;
    int? important;
    String? createDate;

    NoteDB({
        this.id,
        this.title, 
        this.description, 
        this.important,
        this.createDate
    });

    Map<String, dynamic> toMap() {
        Map<String, dynamic> data = Map<String, dynamic>();
        data['id']=id;
        data['title'] = title;
        data['description'] = description;
        data['important'] = important;
        data['createDate']=createDate;
        return data;
    }

    @override toString() {
        return {
            'id': id,
            'title': title,
            'description': description,
            'important': important,
            'createDate':createDate
        }.toString();
    }
}