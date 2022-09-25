package Hackathon.demo.user.dao;

import Hackathon.demo.user.domain.entity.Helper;
import Hackathon.demo.user.domain.entity.ListData;
import Hackathon.demo.user.domain.entity.Needer;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.cloud.FirestoreClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

@Repository
@Slf4j
public class UserDao {

    public List<Helper> getHelpers(String collection_name) throws ExecutionException, InterruptedException {
        List<Helper> list = new ArrayList<>();
        Firestore db = FirestoreClient.getFirestore();
        ApiFuture<QuerySnapshot> future = db.collection(collection_name).get();
        List<QueryDocumentSnapshot> documents = future.get().getDocuments();
        for (QueryDocumentSnapshot document : documents) {
            list.add(document.toObject(Helper.class));
        }
        return list;
    }

    public Helper getHelperDetail(String id, String collection_name) throws Exception {
        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference =
                firestore.collection(collection_name).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        Helper helper = null;
        if(documentSnapshot.exists()){
            helper = documentSnapshot.toObject(Helper.class);
            return helper;
        }
        else{
            return null;
        }
    }

    public Needer getNeederDetail(String id, String collection_name) throws Exception {
        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference =
                firestore.collection(collection_name).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        Needer needer = null;

        if(documentSnapshot.exists()){
            needer = documentSnapshot.toObject(Needer.class);
            return needer;
        }
        else{
            return null;
        }
    }

    public String updateHelper(Helper helper) throws Exception {
        Firestore firestore = FirestoreClient.getFirestore();
        ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture
                = firestore.collection("helper").document(helper.getId()).set(helper);
        return apiFuture.get().getUpdateTime().toString();
    }

    public String insertList(ListData neederData) throws Exception{
        Firestore firestore = FirestoreClient.getFirestore();
        ApiFuture<com.google.cloud.firestore.WriteResult> apiFuture =
                firestore.collection("neederList").document(neederData.getId()).set(neederData);
        return apiFuture.get().getUpdateTime().toString();
    }

    public List<ListData> getNeederList() throws ExecutionException, InterruptedException {
        List<ListData> list = new ArrayList<>();
        Firestore db = FirestoreClient.getFirestore();
        ApiFuture<QuerySnapshot> future = db.collection("neederList").get();
        List<QueryDocumentSnapshot> documents = future.get().getDocuments();
        for (QueryDocumentSnapshot document : documents) {
            list.add(document.toObject(ListData.class));
        }
        return list;
    }
}
